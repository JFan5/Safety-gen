(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v4 ?v2)
             (pred_11 ?v1 ?v5)
             (pred_2 ?v4 ?v5)
             (pred_7 ?v6 ?v4 )
	     (pred_6 ?v4)
             (pred_12 ?v9)
             (pred_8 ?v1)
             (pred_3 ?v5)
             (pred_10 ?v4)
             (pred_9 ?v1)
             (pred_4 ?v4)
             (pred_1 ))



(:action op_2
:parameters (?v11 ?v8 ?v3 ?v10)
:precondition (and (pred_12 ?v11) (pred_12 ?v8) (pred_8 ?v3) (pred_3 ?v10)
          (pred_5 ?v11 ?v8) (pred_11 ?v3 ?v10)
                   (pred_2 ?v8 ?v10) (pred_6 ?v11) 
                   (pred_10 ?v8) (pred_9 ?v3))
:effect (and  (pred_4 ?v8) (not (pred_10 ?v8))))


(:action op_1
:parameters (?v11 ?v7)
:precondition (and (pred_12 ?v11) (pred_12 ?v7)
               (pred_6 ?v11) (pred_5 ?v11 ?v7) (pred_4 ?v7))
:effect (and (pred_6 ?v7) (not (pred_6 ?v11))))

(:action op_4
:parameters (?v11 ?v3)
:precondition (and (pred_12 ?v11) (pred_8 ?v3) 
                  (pred_6 ?v11) (pred_7 ?v3 ?v11) (pred_1 ))
:effect (and (pred_9 ?v3)
   (not (pred_7 ?v3 ?v11)) (not (pred_1 ))))


(:action op_5
:parameters (?v11 ?v12 ?v13)
:precondition (and (pred_12 ?v11) (pred_8 ?v12) (pred_8 ?v13)
                  (pred_6 ?v11) (pred_9 ?v13) (pred_7 ?v12 ?v11))
:effect (and (pred_9 ?v12) (pred_7 ?v13 ?v11)
        (not (pred_9 ?v13)) (not (pred_7 ?v12 ?v11))))

(:action op_3
:parameters (?v11 ?v3)
:precondition (and (pred_12 ?v11) (pred_8 ?v3) 
                  (pred_6 ?v11) (pred_9 ?v3))
:effect (and (pred_1 ) (pred_7 ?v3 ?v11) (not (pred_9 ?v3)))))


	
