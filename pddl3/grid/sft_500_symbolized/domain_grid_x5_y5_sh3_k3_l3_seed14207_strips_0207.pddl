(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v8 ?v10)
             (pred_11 ?v3 ?v9)
             (pred_10 ?v8 ?v9)
             (pred_8 ?v4 ?v8 )
	     (pred_3 ?v8)
             (pred_5 ?v6)
             (pred_6 ?v3)
             (pred_7 ?v9)
             (pred_12 ?v8)
             (pred_9 ?v3)
             (pred_2 ?v8)
             (pred_1 ))



(:action op_1
:parameters (?v12 ?v2 ?v7 ?v5)
:precondition (and (pred_5 ?v12) (pred_5 ?v2) (pred_6 ?v7) (pred_7 ?v5)
          (pred_4 ?v12 ?v2) (pred_11 ?v7 ?v5)
                   (pred_10 ?v2 ?v5) (pred_3 ?v12) 
                   (pred_12 ?v2) (pred_9 ?v7))
:effect (and  (pred_2 ?v2) (not (pred_12 ?v2))))


(:action op_2
:parameters (?v12 ?v11)
:precondition (and (pred_5 ?v12) (pred_5 ?v11)
               (pred_3 ?v12) (pred_4 ?v12 ?v11) (pred_2 ?v11))
:effect (and (pred_3 ?v11) (not (pred_3 ?v12))))

(:action op_3
:parameters (?v12 ?v7)
:precondition (and (pred_5 ?v12) (pred_6 ?v7) 
                  (pred_3 ?v12) (pred_8 ?v7 ?v12) (pred_1 ))
:effect (and (pred_9 ?v7)
   (not (pred_8 ?v7 ?v12)) (not (pred_1 ))))


(:action op_4
:parameters (?v12 ?v1 ?v13)
:precondition (and (pred_5 ?v12) (pred_6 ?v1) (pred_6 ?v13)
                  (pred_3 ?v12) (pred_9 ?v13) (pred_8 ?v1 ?v12))
:effect (and (pred_9 ?v1) (pred_8 ?v13 ?v12)
        (not (pred_9 ?v13)) (not (pred_8 ?v1 ?v12))))

(:action op_5
:parameters (?v12 ?v7)
:precondition (and (pred_5 ?v12) (pred_6 ?v7) 
                  (pred_3 ?v12) (pred_9 ?v7))
:effect (and (pred_1 ) (pred_8 ?v7 ?v12) (not (pred_9 ?v7)))))


	
