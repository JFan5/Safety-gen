(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v4 ?v10)
             (pred_7 ?v2 ?v13)
             (pred_12 ?v4 ?v13)
             (pred_5 ?v7 ?v4 )
	     (pred_1 ?v4)
             (pred_10 ?v6)
             (pred_3 ?v2)
             (pred_2 ?v13)
             (pred_8 ?v4)
             (pred_4 ?v2)
             (pred_9 ?v4)
             (pred_11 ))



(:action op_5
:parameters (?v11 ?v5 ?v1 ?v12)
:precondition (and (pred_10 ?v11) (pred_10 ?v5) (pred_3 ?v1) (pred_2 ?v12)
          (pred_6 ?v11 ?v5) (pred_7 ?v1 ?v12)
                   (pred_12 ?v5 ?v12) (pred_1 ?v11) 
                   (pred_8 ?v5) (pred_4 ?v1))
:effect (and  (pred_9 ?v5) (not (pred_8 ?v5))))


(:action op_4
:parameters (?v11 ?v8)
:precondition (and (pred_10 ?v11) (pred_10 ?v8)
               (pred_1 ?v11) (pred_6 ?v11 ?v8) (pred_9 ?v8))
:effect (and (pred_1 ?v8) (not (pred_1 ?v11))))

(:action op_2
:parameters (?v11 ?v1)
:precondition (and (pred_10 ?v11) (pred_3 ?v1) 
                  (pred_1 ?v11) (pred_5 ?v1 ?v11) (pred_11 ))
:effect (and (pred_4 ?v1)
   (not (pred_5 ?v1 ?v11)) (not (pred_11 ))))


(:action op_1
:parameters (?v11 ?v9 ?v3)
:precondition (and (pred_10 ?v11) (pred_3 ?v9) (pred_3 ?v3)
                  (pred_1 ?v11) (pred_4 ?v3) (pred_5 ?v9 ?v11))
:effect (and (pred_4 ?v9) (pred_5 ?v3 ?v11)
        (not (pred_4 ?v3)) (not (pred_5 ?v9 ?v11))))

(:action op_3
:parameters (?v11 ?v1)
:precondition (and (pred_10 ?v11) (pred_3 ?v1) 
                  (pred_1 ?v11) (pred_4 ?v1))
:effect (and (pred_11 ) (pred_5 ?v1 ?v11) (not (pred_4 ?v1)))))


	
