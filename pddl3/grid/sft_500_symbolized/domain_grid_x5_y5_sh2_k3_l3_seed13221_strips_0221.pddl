(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v5 ?v10)
             (pred_3 ?v1 ?v12)
             (pred_4 ?v5 ?v12)
             (pred_5 ?v7 ?v5 )
	     (pred_8 ?v5)
             (pred_9 ?v8)
             (pred_10 ?v1)
             (pred_1 ?v12)
             (pred_7 ?v5)
             (pred_12 ?v1)
             (pred_6 ?v5)
             (pred_2 ))



(:action op_3
:parameters (?v9 ?v11 ?v2 ?v6)
:precondition (and (pred_9 ?v9) (pred_9 ?v11) (pred_10 ?v2) (pred_1 ?v6)
          (pred_11 ?v9 ?v11) (pred_3 ?v2 ?v6)
                   (pred_4 ?v11 ?v6) (pred_8 ?v9) 
                   (pred_7 ?v11) (pred_12 ?v2))
:effect (and  (pred_6 ?v11) (not (pred_7 ?v11))))


(:action op_2
:parameters (?v9 ?v3)
:precondition (and (pred_9 ?v9) (pred_9 ?v3)
               (pred_8 ?v9) (pred_11 ?v9 ?v3) (pred_6 ?v3))
:effect (and (pred_8 ?v3) (not (pred_8 ?v9))))

(:action op_1
:parameters (?v9 ?v2)
:precondition (and (pred_9 ?v9) (pred_10 ?v2) 
                  (pred_8 ?v9) (pred_5 ?v2 ?v9) (pred_2 ))
:effect (and (pred_12 ?v2)
   (not (pred_5 ?v2 ?v9)) (not (pred_2 ))))


(:action op_4
:parameters (?v9 ?v13 ?v4)
:precondition (and (pred_9 ?v9) (pred_10 ?v13) (pred_10 ?v4)
                  (pred_8 ?v9) (pred_12 ?v4) (pred_5 ?v13 ?v9))
:effect (and (pred_12 ?v13) (pred_5 ?v4 ?v9)
        (not (pred_12 ?v4)) (not (pred_5 ?v13 ?v9))))

(:action op_5
:parameters (?v9 ?v2)
:precondition (and (pred_9 ?v9) (pred_10 ?v2) 
                  (pred_8 ?v9) (pred_12 ?v2))
:effect (and (pred_2 ) (pred_5 ?v2 ?v9) (not (pred_12 ?v2)))))


	
