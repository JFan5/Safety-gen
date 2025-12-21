(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v7 ?v6)
             (pred_1 ?v1 ?v8)
             (pred_11 ?v7 ?v8)
             (pred_12 ?v4 ?v7 )
	     (pred_10 ?v7)
             (pred_8 ?v2)
             (pred_9 ?v1)
             (pred_5 ?v8)
             (pred_2 ?v7)
             (pred_7 ?v1)
             (pred_3 ?v7)
             (pred_4 ))



(:action op_2
:parameters (?v13 ?v5 ?v11 ?v10)
:precondition (and (pred_8 ?v13) (pred_8 ?v5) (pred_9 ?v11) (pred_5 ?v10)
          (pred_6 ?v13 ?v5) (pred_1 ?v11 ?v10)
                   (pred_11 ?v5 ?v10) (pred_10 ?v13) 
                   (pred_2 ?v5) (pred_7 ?v11))
:effect (and  (pred_3 ?v5) (not (pred_2 ?v5))))


(:action op_1
:parameters (?v13 ?v12)
:precondition (and (pred_8 ?v13) (pred_8 ?v12)
               (pred_10 ?v13) (pred_6 ?v13 ?v12) (pred_3 ?v12))
:effect (and (pred_10 ?v12) (not (pred_10 ?v13))))

(:action op_4
:parameters (?v13 ?v11)
:precondition (and (pred_8 ?v13) (pred_9 ?v11) 
                  (pred_10 ?v13) (pred_12 ?v11 ?v13) (pred_4 ))
:effect (and (pred_7 ?v11)
   (not (pred_12 ?v11 ?v13)) (not (pred_4 ))))


(:action op_3
:parameters (?v13 ?v9 ?v3)
:precondition (and (pred_8 ?v13) (pred_9 ?v9) (pred_9 ?v3)
                  (pred_10 ?v13) (pred_7 ?v3) (pred_12 ?v9 ?v13))
:effect (and (pred_7 ?v9) (pred_12 ?v3 ?v13)
        (not (pred_7 ?v3)) (not (pred_12 ?v9 ?v13))))

(:action op_5
:parameters (?v13 ?v11)
:precondition (and (pred_8 ?v13) (pred_9 ?v11) 
                  (pred_10 ?v13) (pred_7 ?v11))
:effect (and (pred_4 ) (pred_12 ?v11 ?v13) (not (pred_7 ?v11)))))


	
