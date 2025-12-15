(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v13 ?v3)
             (pred_7 ?v11 ?v1)
             (pred_1 ?v13 ?v1)
             (pred_8 ?v4 ?v13 )
	     (pred_4 ?v13)
             (pred_5 ?v8)
             (pred_3 ?v11)
             (pred_9 ?v1)
             (pred_11 ?v13)
             (pred_6 ?v11)
             (pred_2 ?v13)
             (pred_10 ))



(:action op_3
:parameters (?v6 ?v2 ?v10 ?v7)
:precondition (and (pred_5 ?v6) (pred_5 ?v2) (pred_3 ?v10) (pred_9 ?v7)
          (pred_12 ?v6 ?v2) (pred_7 ?v10 ?v7)
                   (pred_1 ?v2 ?v7) (pred_4 ?v6) 
                   (pred_11 ?v2) (pred_6 ?v10))
:effect (and  (pred_2 ?v2) (not (pred_11 ?v2))))


(:action op_4
:parameters (?v6 ?v5)
:precondition (and (pred_5 ?v6) (pred_5 ?v5)
               (pred_4 ?v6) (pred_12 ?v6 ?v5) (pred_2 ?v5))
:effect (and (pred_4 ?v5) (not (pred_4 ?v6))))

(:action op_1
:parameters (?v6 ?v10)
:precondition (and (pred_5 ?v6) (pred_3 ?v10) 
                  (pred_4 ?v6) (pred_8 ?v10 ?v6) (pred_10 ))
:effect (and (pred_6 ?v10)
   (not (pred_8 ?v10 ?v6)) (not (pred_10 ))))


(:action op_5
:parameters (?v6 ?v9 ?v12)
:precondition (and (pred_5 ?v6) (pred_3 ?v9) (pred_3 ?v12)
                  (pred_4 ?v6) (pred_6 ?v12) (pred_8 ?v9 ?v6))
:effect (and (pred_6 ?v9) (pred_8 ?v12 ?v6)
        (not (pred_6 ?v12)) (not (pred_8 ?v9 ?v6))))

(:action op_2
:parameters (?v6 ?v10)
:precondition (and (pred_5 ?v6) (pred_3 ?v10) 
                  (pred_4 ?v6) (pred_6 ?v10))
:effect (and (pred_10 ) (pred_8 ?v10 ?v6) (not (pred_6 ?v10)))))


	
