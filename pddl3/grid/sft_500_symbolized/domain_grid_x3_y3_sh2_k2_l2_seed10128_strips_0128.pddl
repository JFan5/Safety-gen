(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v3 ?v7)
             (pred_12 ?v12 ?v6)
             (pred_9 ?v3 ?v6)
             (pred_1 ?v5 ?v3 )
	     (pred_4 ?v3)
             (pred_11 ?v10)
             (pred_10 ?v12)
             (pred_3 ?v6)
             (pred_7 ?v3)
             (pred_5 ?v12)
             (pred_6 ?v3)
             (pred_2 ))



(:action op_4
:parameters (?v13 ?v4 ?v8 ?v2)
:precondition (and (pred_11 ?v13) (pred_11 ?v4) (pred_10 ?v8) (pred_3 ?v2)
          (pred_8 ?v13 ?v4) (pred_12 ?v8 ?v2)
                   (pred_9 ?v4 ?v2) (pred_4 ?v13) 
                   (pred_7 ?v4) (pred_5 ?v8))
:effect (and  (pred_6 ?v4) (not (pred_7 ?v4))))


(:action op_1
:parameters (?v13 ?v11)
:precondition (and (pred_11 ?v13) (pred_11 ?v11)
               (pred_4 ?v13) (pred_8 ?v13 ?v11) (pred_6 ?v11))
:effect (and (pred_4 ?v11) (not (pred_4 ?v13))))

(:action op_3
:parameters (?v13 ?v8)
:precondition (and (pred_11 ?v13) (pred_10 ?v8) 
                  (pred_4 ?v13) (pred_1 ?v8 ?v13) (pred_2 ))
:effect (and (pred_5 ?v8)
   (not (pred_1 ?v8 ?v13)) (not (pred_2 ))))


(:action op_5
:parameters (?v13 ?v9 ?v1)
:precondition (and (pred_11 ?v13) (pred_10 ?v9) (pred_10 ?v1)
                  (pred_4 ?v13) (pred_5 ?v1) (pred_1 ?v9 ?v13))
:effect (and (pred_5 ?v9) (pred_1 ?v1 ?v13)
        (not (pred_5 ?v1)) (not (pred_1 ?v9 ?v13))))

(:action op_2
:parameters (?v13 ?v8)
:precondition (and (pred_11 ?v13) (pred_10 ?v8) 
                  (pred_4 ?v13) (pred_5 ?v8))
:effect (and (pred_2 ) (pred_1 ?v8 ?v13) (not (pred_5 ?v8)))))


	
