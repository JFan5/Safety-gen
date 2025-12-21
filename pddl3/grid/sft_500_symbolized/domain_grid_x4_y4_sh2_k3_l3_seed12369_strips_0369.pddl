(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v5 ?v11)
             (pred_11 ?v9 ?v13)
             (pred_6 ?v5 ?v13)
             (pred_8 ?v8 ?v5 )
	     (pred_5 ?v5)
             (pred_12 ?v3)
             (pred_10 ?v9)
             (pred_2 ?v13)
             (pred_7 ?v5)
             (pred_3 ?v9)
             (pred_9 ?v5)
             (pred_1 ))



(:action op_4
:parameters (?v6 ?v12 ?v7 ?v2)
:precondition (and (pred_12 ?v6) (pred_12 ?v12) (pred_10 ?v7) (pred_2 ?v2)
          (pred_4 ?v6 ?v12) (pred_11 ?v7 ?v2)
                   (pred_6 ?v12 ?v2) (pred_5 ?v6) 
                   (pred_7 ?v12) (pred_3 ?v7))
:effect (and  (pred_9 ?v12) (not (pred_7 ?v12))))


(:action op_3
:parameters (?v6 ?v4)
:precondition (and (pred_12 ?v6) (pred_12 ?v4)
               (pred_5 ?v6) (pred_4 ?v6 ?v4) (pred_9 ?v4))
:effect (and (pred_5 ?v4) (not (pred_5 ?v6))))

(:action op_1
:parameters (?v6 ?v7)
:precondition (and (pred_12 ?v6) (pred_10 ?v7) 
                  (pred_5 ?v6) (pred_8 ?v7 ?v6) (pred_1 ))
:effect (and (pred_3 ?v7)
   (not (pred_8 ?v7 ?v6)) (not (pred_1 ))))


(:action op_2
:parameters (?v6 ?v1 ?v10)
:precondition (and (pred_12 ?v6) (pred_10 ?v1) (pred_10 ?v10)
                  (pred_5 ?v6) (pred_3 ?v10) (pred_8 ?v1 ?v6))
:effect (and (pred_3 ?v1) (pred_8 ?v10 ?v6)
        (not (pred_3 ?v10)) (not (pred_8 ?v1 ?v6))))

(:action op_5
:parameters (?v6 ?v7)
:precondition (and (pred_12 ?v6) (pred_10 ?v7) 
                  (pred_5 ?v6) (pred_3 ?v7))
:effect (and (pred_1 ) (pred_8 ?v7 ?v6) (not (pred_3 ?v7)))))


	
