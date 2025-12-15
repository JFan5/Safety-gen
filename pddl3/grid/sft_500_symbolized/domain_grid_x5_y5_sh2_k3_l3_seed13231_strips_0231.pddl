(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v9 ?v8)
             (pred_11 ?v4 ?v13)
             (pred_4 ?v9 ?v13)
             (pred_9 ?v2 ?v9 )
	     (pred_8 ?v9)
             (pred_1 ?v10)
             (pred_12 ?v4)
             (pred_2 ?v13)
             (pred_5 ?v9)
             (pred_6 ?v4)
             (pred_7 ?v9)
             (pred_3 ))



(:action op_5
:parameters (?v3 ?v6 ?v1 ?v12)
:precondition (and (pred_1 ?v3) (pred_1 ?v6) (pred_12 ?v1) (pred_2 ?v12)
          (pred_10 ?v3 ?v6) (pred_11 ?v1 ?v12)
                   (pred_4 ?v6 ?v12) (pred_8 ?v3) 
                   (pred_5 ?v6) (pred_6 ?v1))
:effect (and  (pred_7 ?v6) (not (pred_5 ?v6))))


(:action op_3
:parameters (?v3 ?v11)
:precondition (and (pred_1 ?v3) (pred_1 ?v11)
               (pred_8 ?v3) (pred_10 ?v3 ?v11) (pred_7 ?v11))
:effect (and (pred_8 ?v11) (not (pred_8 ?v3))))

(:action op_2
:parameters (?v3 ?v1)
:precondition (and (pred_1 ?v3) (pred_12 ?v1) 
                  (pred_8 ?v3) (pred_9 ?v1 ?v3) (pred_3 ))
:effect (and (pred_6 ?v1)
   (not (pred_9 ?v1 ?v3)) (not (pred_3 ))))


(:action op_4
:parameters (?v3 ?v5 ?v7)
:precondition (and (pred_1 ?v3) (pred_12 ?v5) (pred_12 ?v7)
                  (pred_8 ?v3) (pred_6 ?v7) (pred_9 ?v5 ?v3))
:effect (and (pred_6 ?v5) (pred_9 ?v7 ?v3)
        (not (pred_6 ?v7)) (not (pred_9 ?v5 ?v3))))

(:action op_1
:parameters (?v3 ?v1)
:precondition (and (pred_1 ?v3) (pred_12 ?v1) 
                  (pred_8 ?v3) (pred_6 ?v1))
:effect (and (pred_3 ) (pred_9 ?v1 ?v3) (not (pred_6 ?v1)))))


	
