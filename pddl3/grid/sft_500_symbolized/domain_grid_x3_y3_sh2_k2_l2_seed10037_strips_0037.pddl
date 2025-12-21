(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v4 ?v12)
             (pred_8 ?v13 ?v1)
             (pred_11 ?v4 ?v1)
             (pred_6 ?v6 ?v4 )
	     (pred_12 ?v4)
             (pred_7 ?v5)
             (pred_10 ?v13)
             (pred_1 ?v1)
             (pred_3 ?v4)
             (pred_5 ?v13)
             (pred_9 ?v4)
             (pred_2 ))



(:action op_5
:parameters (?v11 ?v2 ?v3 ?v8)
:precondition (and (pred_7 ?v11) (pred_7 ?v2) (pred_10 ?v3) (pred_1 ?v8)
          (pred_4 ?v11 ?v2) (pred_8 ?v3 ?v8)
                   (pred_11 ?v2 ?v8) (pred_12 ?v11) 
                   (pred_3 ?v2) (pred_5 ?v3))
:effect (and  (pred_9 ?v2) (not (pred_3 ?v2))))


(:action op_2
:parameters (?v11 ?v7)
:precondition (and (pred_7 ?v11) (pred_7 ?v7)
               (pred_12 ?v11) (pred_4 ?v11 ?v7) (pred_9 ?v7))
:effect (and (pred_12 ?v7) (not (pred_12 ?v11))))

(:action op_4
:parameters (?v11 ?v3)
:precondition (and (pred_7 ?v11) (pred_10 ?v3) 
                  (pred_12 ?v11) (pred_6 ?v3 ?v11) (pred_2 ))
:effect (and (pred_5 ?v3)
   (not (pred_6 ?v3 ?v11)) (not (pred_2 ))))


(:action op_3
:parameters (?v11 ?v9 ?v10)
:precondition (and (pred_7 ?v11) (pred_10 ?v9) (pred_10 ?v10)
                  (pred_12 ?v11) (pred_5 ?v10) (pred_6 ?v9 ?v11))
:effect (and (pred_5 ?v9) (pred_6 ?v10 ?v11)
        (not (pred_5 ?v10)) (not (pred_6 ?v9 ?v11))))

(:action op_1
:parameters (?v11 ?v3)
:precondition (and (pred_7 ?v11) (pred_10 ?v3) 
                  (pred_12 ?v11) (pred_5 ?v3))
:effect (and (pred_2 ) (pred_6 ?v3 ?v11) (not (pred_5 ?v3)))))


	
