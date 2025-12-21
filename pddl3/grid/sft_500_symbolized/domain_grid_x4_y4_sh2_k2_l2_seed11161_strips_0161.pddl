(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v10 ?v5)
             (pred_3 ?v3 ?v6)
             (pred_8 ?v10 ?v6)
             (pred_4 ?v12 ?v10 )
	     (pred_11 ?v10)
             (pred_7 ?v2)
             (pred_6 ?v3)
             (pred_12 ?v6)
             (pred_5 ?v10)
             (pred_1 ?v3)
             (pred_10 ?v10)
             (pred_9 ))



(:action op_3
:parameters (?v4 ?v1 ?v11 ?v7)
:precondition (and (pred_7 ?v4) (pred_7 ?v1) (pred_6 ?v11) (pred_12 ?v7)
          (pred_2 ?v4 ?v1) (pred_3 ?v11 ?v7)
                   (pred_8 ?v1 ?v7) (pred_11 ?v4) 
                   (pred_5 ?v1) (pred_1 ?v11))
:effect (and  (pred_10 ?v1) (not (pred_5 ?v1))))


(:action op_5
:parameters (?v4 ?v9)
:precondition (and (pred_7 ?v4) (pred_7 ?v9)
               (pred_11 ?v4) (pred_2 ?v4 ?v9) (pred_10 ?v9))
:effect (and (pred_11 ?v9) (not (pred_11 ?v4))))

(:action op_1
:parameters (?v4 ?v11)
:precondition (and (pred_7 ?v4) (pred_6 ?v11) 
                  (pred_11 ?v4) (pred_4 ?v11 ?v4) (pred_9 ))
:effect (and (pred_1 ?v11)
   (not (pred_4 ?v11 ?v4)) (not (pred_9 ))))


(:action op_2
:parameters (?v4 ?v8 ?v13)
:precondition (and (pred_7 ?v4) (pred_6 ?v8) (pred_6 ?v13)
                  (pred_11 ?v4) (pred_1 ?v13) (pred_4 ?v8 ?v4))
:effect (and (pred_1 ?v8) (pred_4 ?v13 ?v4)
        (not (pred_1 ?v13)) (not (pred_4 ?v8 ?v4))))

(:action op_4
:parameters (?v4 ?v11)
:precondition (and (pred_7 ?v4) (pred_6 ?v11) 
                  (pred_11 ?v4) (pred_1 ?v11))
:effect (and (pred_9 ) (pred_4 ?v11 ?v4) (not (pred_1 ?v11)))))


	
