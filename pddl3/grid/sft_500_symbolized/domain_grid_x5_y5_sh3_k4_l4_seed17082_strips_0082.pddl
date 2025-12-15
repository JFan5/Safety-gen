(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v6 ?v3)
             (pred_5 ?v12 ?v5)
             (pred_11 ?v6 ?v5)
             (pred_4 ?v4 ?v6 )
	     (pred_8 ?v6)
             (pred_10 ?v1)
             (pred_12 ?v12)
             (pred_6 ?v5)
             (pred_7 ?v6)
             (pred_9 ?v12)
             (pred_3 ?v6)
             (pred_2 ))



(:action op_1
:parameters (?v11 ?v2 ?v10 ?v8)
:precondition (and (pred_10 ?v11) (pred_10 ?v2) (pred_12 ?v10) (pred_6 ?v8)
          (pred_1 ?v11 ?v2) (pred_5 ?v10 ?v8)
                   (pred_11 ?v2 ?v8) (pred_8 ?v11) 
                   (pred_7 ?v2) (pred_9 ?v10))
:effect (and  (pred_3 ?v2) (not (pred_7 ?v2))))


(:action op_2
:parameters (?v11 ?v9)
:precondition (and (pred_10 ?v11) (pred_10 ?v9)
               (pred_8 ?v11) (pred_1 ?v11 ?v9) (pred_3 ?v9))
:effect (and (pred_8 ?v9) (not (pred_8 ?v11))))

(:action op_5
:parameters (?v11 ?v10)
:precondition (and (pred_10 ?v11) (pred_12 ?v10) 
                  (pred_8 ?v11) (pred_4 ?v10 ?v11) (pred_2 ))
:effect (and (pred_9 ?v10)
   (not (pred_4 ?v10 ?v11)) (not (pred_2 ))))


(:action op_3
:parameters (?v11 ?v13 ?v7)
:precondition (and (pred_10 ?v11) (pred_12 ?v13) (pred_12 ?v7)
                  (pred_8 ?v11) (pred_9 ?v7) (pred_4 ?v13 ?v11))
:effect (and (pred_9 ?v13) (pred_4 ?v7 ?v11)
        (not (pred_9 ?v7)) (not (pred_4 ?v13 ?v11))))

(:action op_4
:parameters (?v11 ?v10)
:precondition (and (pred_10 ?v11) (pred_12 ?v10) 
                  (pred_8 ?v11) (pred_9 ?v10))
:effect (and (pred_2 ) (pred_4 ?v10 ?v11) (not (pred_9 ?v10)))))


	
