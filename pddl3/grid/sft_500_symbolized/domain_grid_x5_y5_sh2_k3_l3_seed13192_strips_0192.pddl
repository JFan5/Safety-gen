(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v12 ?v3)
             (pred_7 ?v8 ?v6)
             (pred_12 ?v12 ?v6)
             (pred_6 ?v13 ?v12 )
	     (pred_2 ?v12)
             (pred_9 ?v5)
             (pred_10 ?v8)
             (pred_4 ?v6)
             (pred_8 ?v12)
             (pred_3 ?v8)
             (pred_1 ?v12)
             (pred_11 ))



(:action op_4
:parameters (?v2 ?v1 ?v9 ?v7)
:precondition (and (pred_9 ?v2) (pred_9 ?v1) (pred_10 ?v9) (pred_4 ?v7)
          (pred_5 ?v2 ?v1) (pred_7 ?v9 ?v7)
                   (pred_12 ?v1 ?v7) (pred_2 ?v2) 
                   (pred_8 ?v1) (pred_3 ?v9))
:effect (and  (pred_1 ?v1) (not (pred_8 ?v1))))


(:action op_2
:parameters (?v2 ?v11)
:precondition (and (pred_9 ?v2) (pred_9 ?v11)
               (pred_2 ?v2) (pred_5 ?v2 ?v11) (pred_1 ?v11))
:effect (and (pred_2 ?v11) (not (pred_2 ?v2))))

(:action op_5
:parameters (?v2 ?v9)
:precondition (and (pred_9 ?v2) (pred_10 ?v9) 
                  (pred_2 ?v2) (pred_6 ?v9 ?v2) (pred_11 ))
:effect (and (pred_3 ?v9)
   (not (pred_6 ?v9 ?v2)) (not (pred_11 ))))


(:action op_1
:parameters (?v2 ?v4 ?v10)
:precondition (and (pred_9 ?v2) (pred_10 ?v4) (pred_10 ?v10)
                  (pred_2 ?v2) (pred_3 ?v10) (pred_6 ?v4 ?v2))
:effect (and (pred_3 ?v4) (pred_6 ?v10 ?v2)
        (not (pred_3 ?v10)) (not (pred_6 ?v4 ?v2))))

(:action op_3
:parameters (?v2 ?v9)
:precondition (and (pred_9 ?v2) (pred_10 ?v9) 
                  (pred_2 ?v2) (pred_3 ?v9))
:effect (and (pred_11 ) (pred_6 ?v9 ?v2) (not (pred_3 ?v9)))))


	
