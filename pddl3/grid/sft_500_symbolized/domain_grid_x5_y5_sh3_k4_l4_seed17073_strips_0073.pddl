(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v2 ?v13)
             (pred_12 ?v10 ?v8)
             (pred_6 ?v2 ?v8)
             (pred_4 ?v6 ?v2 )
	     (pred_8 ?v2)
             (pred_9 ?v5)
             (pred_3 ?v10)
             (pred_2 ?v8)
             (pred_10 ?v2)
             (pred_5 ?v10)
             (pred_7 ?v2)
             (pred_1 ))



(:action op_2
:parameters (?v4 ?v12 ?v3 ?v11)
:precondition (and (pred_9 ?v4) (pred_9 ?v12) (pred_3 ?v3) (pred_2 ?v11)
          (pred_11 ?v4 ?v12) (pred_12 ?v3 ?v11)
                   (pred_6 ?v12 ?v11) (pred_8 ?v4) 
                   (pred_10 ?v12) (pred_5 ?v3))
:effect (and  (pred_7 ?v12) (not (pred_10 ?v12))))


(:action op_1
:parameters (?v4 ?v1)
:precondition (and (pred_9 ?v4) (pred_9 ?v1)
               (pred_8 ?v4) (pred_11 ?v4 ?v1) (pred_7 ?v1))
:effect (and (pred_8 ?v1) (not (pred_8 ?v4))))

(:action op_5
:parameters (?v4 ?v3)
:precondition (and (pred_9 ?v4) (pred_3 ?v3) 
                  (pred_8 ?v4) (pred_4 ?v3 ?v4) (pred_1 ))
:effect (and (pred_5 ?v3)
   (not (pred_4 ?v3 ?v4)) (not (pred_1 ))))


(:action op_3
:parameters (?v4 ?v7 ?v9)
:precondition (and (pred_9 ?v4) (pred_3 ?v7) (pred_3 ?v9)
                  (pred_8 ?v4) (pred_5 ?v9) (pred_4 ?v7 ?v4))
:effect (and (pred_5 ?v7) (pred_4 ?v9 ?v4)
        (not (pred_5 ?v9)) (not (pred_4 ?v7 ?v4))))

(:action op_4
:parameters (?v4 ?v3)
:precondition (and (pred_9 ?v4) (pred_3 ?v3) 
                  (pred_8 ?v4) (pred_5 ?v3))
:effect (and (pred_1 ) (pred_4 ?v3 ?v4) (not (pred_5 ?v3)))))


	
