(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v2 ?v5)
             (pred_9 ?v7 ?v10)
             (pred_4 ?v2 ?v10)
             (pred_11 ?v3 ?v2 )
	     (pred_1 ?v2)
             (pred_5 ?v6)
             (pred_3 ?v7)
             (pred_12 ?v10)
             (pred_6 ?v2)
             (pred_10 ?v7)
             (pred_2 ?v2)
             (pred_7 ))



(:action op_5
:parameters (?v13 ?v11 ?v12 ?v9)
:precondition (and (pred_5 ?v13) (pred_5 ?v11) (pred_3 ?v12) (pred_12 ?v9)
          (pred_8 ?v13 ?v11) (pred_9 ?v12 ?v9)
                   (pred_4 ?v11 ?v9) (pred_1 ?v13) 
                   (pred_6 ?v11) (pred_10 ?v12))
:effect (and  (pred_2 ?v11) (not (pred_6 ?v11))))


(:action op_4
:parameters (?v13 ?v8)
:precondition (and (pred_5 ?v13) (pred_5 ?v8)
               (pred_1 ?v13) (pred_8 ?v13 ?v8) (pred_2 ?v8))
:effect (and (pred_1 ?v8) (not (pred_1 ?v13))))

(:action op_2
:parameters (?v13 ?v12)
:precondition (and (pred_5 ?v13) (pred_3 ?v12) 
                  (pred_1 ?v13) (pred_11 ?v12 ?v13) (pred_7 ))
:effect (and (pred_10 ?v12)
   (not (pred_11 ?v12 ?v13)) (not (pred_7 ))))


(:action op_1
:parameters (?v13 ?v4 ?v1)
:precondition (and (pred_5 ?v13) (pred_3 ?v4) (pred_3 ?v1)
                  (pred_1 ?v13) (pred_10 ?v1) (pred_11 ?v4 ?v13))
:effect (and (pred_10 ?v4) (pred_11 ?v1 ?v13)
        (not (pred_10 ?v1)) (not (pred_11 ?v4 ?v13))))

(:action op_3
:parameters (?v13 ?v12)
:precondition (and (pred_5 ?v13) (pred_3 ?v12) 
                  (pred_1 ?v13) (pred_10 ?v12))
:effect (and (pred_7 ) (pred_11 ?v12 ?v13) (not (pred_10 ?v12)))))


	
