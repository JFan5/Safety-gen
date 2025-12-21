(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v5 ?v12)
             (pred_5 ?v13 ?v1)
             (pred_6 ?v5 ?v1)
             (pred_12 ?v7 ?v5 )
	     (pred_7 ?v5)
             (pred_3 ?v3)
             (pred_11 ?v13)
             (pred_8 ?v1)
             (pred_4 ?v5)
             (pred_2 ?v13)
             (pred_10 ?v5)
             (pred_1 ))



(:action op_4
:parameters (?v11 ?v9 ?v4 ?v8)
:precondition (and (pred_3 ?v11) (pred_3 ?v9) (pred_11 ?v4) (pred_8 ?v8)
          (pred_9 ?v11 ?v9) (pred_5 ?v4 ?v8)
                   (pred_6 ?v9 ?v8) (pred_7 ?v11) 
                   (pred_4 ?v9) (pred_2 ?v4))
:effect (and  (pred_10 ?v9) (not (pred_4 ?v9))))


(:action op_1
:parameters (?v11 ?v10)
:precondition (and (pred_3 ?v11) (pred_3 ?v10)
               (pred_7 ?v11) (pred_9 ?v11 ?v10) (pred_10 ?v10))
:effect (and (pred_7 ?v10) (not (pred_7 ?v11))))

(:action op_3
:parameters (?v11 ?v4)
:precondition (and (pred_3 ?v11) (pred_11 ?v4) 
                  (pred_7 ?v11) (pred_12 ?v4 ?v11) (pred_1 ))
:effect (and (pred_2 ?v4)
   (not (pred_12 ?v4 ?v11)) (not (pred_1 ))))


(:action op_5
:parameters (?v11 ?v6 ?v2)
:precondition (and (pred_3 ?v11) (pred_11 ?v6) (pred_11 ?v2)
                  (pred_7 ?v11) (pred_2 ?v2) (pred_12 ?v6 ?v11))
:effect (and (pred_2 ?v6) (pred_12 ?v2 ?v11)
        (not (pred_2 ?v2)) (not (pred_12 ?v6 ?v11))))

(:action op_2
:parameters (?v11 ?v4)
:precondition (and (pred_3 ?v11) (pred_11 ?v4) 
                  (pred_7 ?v11) (pred_2 ?v4))
:effect (and (pred_1 ) (pred_12 ?v4 ?v11) (not (pred_2 ?v4)))))


	
