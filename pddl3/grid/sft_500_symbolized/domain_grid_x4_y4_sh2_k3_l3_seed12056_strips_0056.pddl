(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v4 ?v5)
             (pred_10 ?v12 ?v3)
             (pred_4 ?v4 ?v3)
             (pred_11 ?v10 ?v4 )
	     (pred_5 ?v4)
             (pred_6 ?v2)
             (pred_9 ?v12)
             (pred_8 ?v3)
             (pred_7 ?v4)
             (pred_2 ?v12)
             (pred_3 ?v4)
             (pred_1 ))



(:action op_3
:parameters (?v11 ?v9 ?v8 ?v6)
:precondition (and (pred_6 ?v11) (pred_6 ?v9) (pred_9 ?v8) (pred_8 ?v6)
          (pred_12 ?v11 ?v9) (pred_10 ?v8 ?v6)
                   (pred_4 ?v9 ?v6) (pred_5 ?v11) 
                   (pred_7 ?v9) (pred_2 ?v8))
:effect (and  (pred_3 ?v9) (not (pred_7 ?v9))))


(:action op_1
:parameters (?v11 ?v1)
:precondition (and (pred_6 ?v11) (pred_6 ?v1)
               (pred_5 ?v11) (pred_12 ?v11 ?v1) (pred_3 ?v1))
:effect (and (pred_5 ?v1) (not (pred_5 ?v11))))

(:action op_2
:parameters (?v11 ?v8)
:precondition (and (pred_6 ?v11) (pred_9 ?v8) 
                  (pred_5 ?v11) (pred_11 ?v8 ?v11) (pred_1 ))
:effect (and (pred_2 ?v8)
   (not (pred_11 ?v8 ?v11)) (not (pred_1 ))))


(:action op_5
:parameters (?v11 ?v13 ?v7)
:precondition (and (pred_6 ?v11) (pred_9 ?v13) (pred_9 ?v7)
                  (pred_5 ?v11) (pred_2 ?v7) (pred_11 ?v13 ?v11))
:effect (and (pred_2 ?v13) (pred_11 ?v7 ?v11)
        (not (pred_2 ?v7)) (not (pred_11 ?v13 ?v11))))

(:action op_4
:parameters (?v11 ?v8)
:precondition (and (pred_6 ?v11) (pred_9 ?v8) 
                  (pred_5 ?v11) (pred_2 ?v8))
:effect (and (pred_1 ) (pred_11 ?v8 ?v11) (not (pred_2 ?v8)))))


	
