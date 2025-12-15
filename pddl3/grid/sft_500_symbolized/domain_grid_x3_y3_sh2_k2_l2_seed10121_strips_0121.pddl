(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v8 ?v7)
             (pred_7 ?v5 ?v3)
             (pred_12 ?v8 ?v3)
             (pred_1 ?v4 ?v8 )
	     (pred_8 ?v8)
             (pred_10 ?v13)
             (pred_11 ?v5)
             (pred_4 ?v3)
             (pred_5 ?v8)
             (pred_3 ?v5)
             (pred_2 ?v8)
             (pred_9 ))



(:action op_5
:parameters (?v11 ?v2 ?v9 ?v10)
:precondition (and (pred_10 ?v11) (pred_10 ?v2) (pred_11 ?v9) (pred_4 ?v10)
          (pred_6 ?v11 ?v2) (pred_7 ?v9 ?v10)
                   (pred_12 ?v2 ?v10) (pred_8 ?v11) 
                   (pred_5 ?v2) (pred_3 ?v9))
:effect (and  (pred_2 ?v2) (not (pred_5 ?v2))))


(:action op_4
:parameters (?v11 ?v6)
:precondition (and (pred_10 ?v11) (pred_10 ?v6)
               (pred_8 ?v11) (pred_6 ?v11 ?v6) (pred_2 ?v6))
:effect (and (pred_8 ?v6) (not (pred_8 ?v11))))

(:action op_1
:parameters (?v11 ?v9)
:precondition (and (pred_10 ?v11) (pred_11 ?v9) 
                  (pred_8 ?v11) (pred_1 ?v9 ?v11) (pred_9 ))
:effect (and (pred_3 ?v9)
   (not (pred_1 ?v9 ?v11)) (not (pred_9 ))))


(:action op_3
:parameters (?v11 ?v1 ?v12)
:precondition (and (pred_10 ?v11) (pred_11 ?v1) (pred_11 ?v12)
                  (pred_8 ?v11) (pred_3 ?v12) (pred_1 ?v1 ?v11))
:effect (and (pred_3 ?v1) (pred_1 ?v12 ?v11)
        (not (pred_3 ?v12)) (not (pred_1 ?v1 ?v11))))

(:action op_2
:parameters (?v11 ?v9)
:precondition (and (pred_10 ?v11) (pred_11 ?v9) 
                  (pred_8 ?v11) (pred_3 ?v9))
:effect (and (pred_9 ) (pred_1 ?v9 ?v11) (not (pred_3 ?v9)))))


	
