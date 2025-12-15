(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v9 ?v13)
             (pred_2 ?v4 ?v3)
             (pred_5 ?v9 ?v3)
             (pred_4 ?v1 ?v9 )
	     (pred_12 ?v9)
             (pred_8 ?v8)
             (pred_10 ?v4)
             (pred_9 ?v3)
             (pred_7 ?v9)
             (pred_6 ?v4)
             (pred_3 ?v9)
             (pred_1 ))



(:action op_3
:parameters (?v6 ?v5 ?v10 ?v11)
:precondition (and (pred_8 ?v6) (pred_8 ?v5) (pred_10 ?v10) (pred_9 ?v11)
          (pred_11 ?v6 ?v5) (pred_2 ?v10 ?v11)
                   (pred_5 ?v5 ?v11) (pred_12 ?v6) 
                   (pred_7 ?v5) (pred_6 ?v10))
:effect (and  (pred_3 ?v5) (not (pred_7 ?v5))))


(:action op_2
:parameters (?v6 ?v2)
:precondition (and (pred_8 ?v6) (pred_8 ?v2)
               (pred_12 ?v6) (pred_11 ?v6 ?v2) (pred_3 ?v2))
:effect (and (pred_12 ?v2) (not (pred_12 ?v6))))

(:action op_5
:parameters (?v6 ?v10)
:precondition (and (pred_8 ?v6) (pred_10 ?v10) 
                  (pred_12 ?v6) (pred_4 ?v10 ?v6) (pred_1 ))
:effect (and (pred_6 ?v10)
   (not (pred_4 ?v10 ?v6)) (not (pred_1 ))))


(:action op_1
:parameters (?v6 ?v12 ?v7)
:precondition (and (pred_8 ?v6) (pred_10 ?v12) (pred_10 ?v7)
                  (pred_12 ?v6) (pred_6 ?v7) (pred_4 ?v12 ?v6))
:effect (and (pred_6 ?v12) (pred_4 ?v7 ?v6)
        (not (pred_6 ?v7)) (not (pred_4 ?v12 ?v6))))

(:action op_4
:parameters (?v6 ?v10)
:precondition (and (pred_8 ?v6) (pred_10 ?v10) 
                  (pred_12 ?v6) (pred_6 ?v10))
:effect (and (pred_1 ) (pred_4 ?v10 ?v6) (not (pred_6 ?v10)))))


	
