(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v2 ?v6)
             (pred_5 ?v13 ?v3)
             (pred_7 ?v2 ?v3)
             (pred_2 ?v12 ?v2 )
	     (pred_9 ?v2)
             (pred_1 ?v11)
             (pred_11 ?v13)
             (pred_10 ?v3)
             (pred_4 ?v2)
             (pred_3 ?v13)
             (pred_12 ?v2)
             (pred_8 ))



(:action op_1
:parameters (?v7 ?v10 ?v4 ?v9)
:precondition (and (pred_1 ?v7) (pred_1 ?v10) (pred_11 ?v4) (pred_10 ?v9)
          (pred_6 ?v7 ?v10) (pred_5 ?v4 ?v9)
                   (pred_7 ?v10 ?v9) (pred_9 ?v7) 
                   (pred_4 ?v10) (pred_3 ?v4))
:effect (and  (pred_12 ?v10) (not (pred_4 ?v10))))


(:action op_5
:parameters (?v7 ?v5)
:precondition (and (pred_1 ?v7) (pred_1 ?v5)
               (pred_9 ?v7) (pred_6 ?v7 ?v5) (pred_12 ?v5))
:effect (and (pred_9 ?v5) (not (pred_9 ?v7))))

(:action op_4
:parameters (?v7 ?v4)
:precondition (and (pred_1 ?v7) (pred_11 ?v4) 
                  (pred_9 ?v7) (pred_2 ?v4 ?v7) (pred_8 ))
:effect (and (pred_3 ?v4)
   (not (pred_2 ?v4 ?v7)) (not (pred_8 ))))


(:action op_2
:parameters (?v7 ?v1 ?v8)
:precondition (and (pred_1 ?v7) (pred_11 ?v1) (pred_11 ?v8)
                  (pred_9 ?v7) (pred_3 ?v8) (pred_2 ?v1 ?v7))
:effect (and (pred_3 ?v1) (pred_2 ?v8 ?v7)
        (not (pred_3 ?v8)) (not (pred_2 ?v1 ?v7))))

(:action op_3
:parameters (?v7 ?v4)
:precondition (and (pred_1 ?v7) (pred_11 ?v4) 
                  (pred_9 ?v7) (pred_3 ?v4))
:effect (and (pred_8 ) (pred_2 ?v4 ?v7) (not (pred_3 ?v4)))))


	
