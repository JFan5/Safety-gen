(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v12 ?v1)
             (pred_3 ?v10 ?v8)
             (pred_2 ?v12 ?v8)
             (pred_10 ?v7 ?v12 )
	     (pred_11 ?v12)
             (pred_6 ?v6)
             (pred_4 ?v10)
             (pred_9 ?v8)
             (pred_8 ?v12)
             (pred_5 ?v10)
             (pred_12 ?v12)
             (pred_7 ))



(:action op_2
:parameters (?v13 ?v4 ?v9 ?v11)
:precondition (and (pred_6 ?v13) (pred_6 ?v4) (pred_4 ?v9) (pred_9 ?v11)
          (pred_1 ?v13 ?v4) (pred_3 ?v9 ?v11)
                   (pred_2 ?v4 ?v11) (pred_11 ?v13) 
                   (pred_8 ?v4) (pred_5 ?v9))
:effect (and  (pred_12 ?v4) (not (pred_8 ?v4))))


(:action op_1
:parameters (?v13 ?v2)
:precondition (and (pred_6 ?v13) (pred_6 ?v2)
               (pred_11 ?v13) (pred_1 ?v13 ?v2) (pred_12 ?v2))
:effect (and (pred_11 ?v2) (not (pred_11 ?v13))))

(:action op_4
:parameters (?v13 ?v9)
:precondition (and (pred_6 ?v13) (pred_4 ?v9) 
                  (pred_11 ?v13) (pred_10 ?v9 ?v13) (pred_7 ))
:effect (and (pred_5 ?v9)
   (not (pred_10 ?v9 ?v13)) (not (pred_7 ))))


(:action op_5
:parameters (?v13 ?v3 ?v5)
:precondition (and (pred_6 ?v13) (pred_4 ?v3) (pred_4 ?v5)
                  (pred_11 ?v13) (pred_5 ?v5) (pred_10 ?v3 ?v13))
:effect (and (pred_5 ?v3) (pred_10 ?v5 ?v13)
        (not (pred_5 ?v5)) (not (pred_10 ?v3 ?v13))))

(:action op_3
:parameters (?v13 ?v9)
:precondition (and (pred_6 ?v13) (pred_4 ?v9) 
                  (pred_11 ?v13) (pred_5 ?v9))
:effect (and (pred_7 ) (pred_10 ?v9 ?v13) (not (pred_5 ?v9)))))


	
