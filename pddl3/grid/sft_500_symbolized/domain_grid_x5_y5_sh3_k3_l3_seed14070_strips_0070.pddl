(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v6 ?v7)
             (pred_6 ?v5 ?v12)
             (pred_3 ?v6 ?v12)
             (pred_9 ?v10 ?v6 )
	     (pred_5 ?v6)
             (pred_10 ?v1)
             (pred_2 ?v5)
             (pred_1 ?v12)
             (pred_11 ?v6)
             (pred_7 ?v5)
             (pred_4 ?v6)
             (pred_12 ))



(:action op_4
:parameters (?v13 ?v4 ?v9 ?v3)
:precondition (and (pred_10 ?v13) (pred_10 ?v4) (pred_2 ?v9) (pred_1 ?v3)
          (pred_8 ?v13 ?v4) (pred_6 ?v9 ?v3)
                   (pred_3 ?v4 ?v3) (pred_5 ?v13) 
                   (pred_11 ?v4) (pred_7 ?v9))
:effect (and  (pred_4 ?v4) (not (pred_11 ?v4))))


(:action op_2
:parameters (?v13 ?v11)
:precondition (and (pred_10 ?v13) (pred_10 ?v11)
               (pred_5 ?v13) (pred_8 ?v13 ?v11) (pred_4 ?v11))
:effect (and (pred_5 ?v11) (not (pred_5 ?v13))))

(:action op_3
:parameters (?v13 ?v9)
:precondition (and (pred_10 ?v13) (pred_2 ?v9) 
                  (pred_5 ?v13) (pred_9 ?v9 ?v13) (pred_12 ))
:effect (and (pred_7 ?v9)
   (not (pred_9 ?v9 ?v13)) (not (pred_12 ))))


(:action op_5
:parameters (?v13 ?v8 ?v2)
:precondition (and (pred_10 ?v13) (pred_2 ?v8) (pred_2 ?v2)
                  (pred_5 ?v13) (pred_7 ?v2) (pred_9 ?v8 ?v13))
:effect (and (pred_7 ?v8) (pred_9 ?v2 ?v13)
        (not (pred_7 ?v2)) (not (pred_9 ?v8 ?v13))))

(:action op_1
:parameters (?v13 ?v9)
:precondition (and (pred_10 ?v13) (pred_2 ?v9) 
                  (pred_5 ?v13) (pred_7 ?v9))
:effect (and (pred_12 ) (pred_9 ?v9 ?v13) (not (pred_7 ?v9)))))


	
