(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v5 ?v2)
             (pred_1 ?v12 ?v8)
             (pred_6 ?v5 ?v8)
             (pred_10 ?v4 ?v5 )
	     (pred_8 ?v5)
             (pred_12 ?v10)
             (pred_4 ?v12)
             (pred_2 ?v8)
             (pred_7 ?v5)
             (pred_5 ?v12)
             (pred_9 ?v5)
             (pred_11 ))



(:action op_3
:parameters (?v11 ?v9 ?v13 ?v7)
:precondition (and (pred_12 ?v11) (pred_12 ?v9) (pred_4 ?v13) (pred_2 ?v7)
          (pred_3 ?v11 ?v9) (pred_1 ?v13 ?v7)
                   (pred_6 ?v9 ?v7) (pred_8 ?v11) 
                   (pred_7 ?v9) (pred_5 ?v13))
:effect (and  (pred_9 ?v9) (not (pred_7 ?v9))))


(:action op_5
:parameters (?v11 ?v6)
:precondition (and (pred_12 ?v11) (pred_12 ?v6)
               (pred_8 ?v11) (pred_3 ?v11 ?v6) (pred_9 ?v6))
:effect (and (pred_8 ?v6) (not (pred_8 ?v11))))

(:action op_1
:parameters (?v11 ?v13)
:precondition (and (pred_12 ?v11) (pred_4 ?v13) 
                  (pred_8 ?v11) (pred_10 ?v13 ?v11) (pred_11 ))
:effect (and (pred_5 ?v13)
   (not (pred_10 ?v13 ?v11)) (not (pred_11 ))))


(:action op_4
:parameters (?v11 ?v3 ?v1)
:precondition (and (pred_12 ?v11) (pred_4 ?v3) (pred_4 ?v1)
                  (pred_8 ?v11) (pred_5 ?v1) (pred_10 ?v3 ?v11))
:effect (and (pred_5 ?v3) (pred_10 ?v1 ?v11)
        (not (pred_5 ?v1)) (not (pred_10 ?v3 ?v11))))

(:action op_2
:parameters (?v11 ?v13)
:precondition (and (pred_12 ?v11) (pred_4 ?v13) 
                  (pred_8 ?v11) (pred_5 ?v13))
:effect (and (pred_11 ) (pred_10 ?v13 ?v11) (not (pred_5 ?v13)))))


	
