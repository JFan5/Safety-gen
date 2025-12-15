(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v1 ?v12)
             (pred_4 ?v11 ?v6)
             (pred_6 ?v1 ?v6)
             (pred_10 ?v3 ?v1 )
	     (pred_5 ?v1)
             (pred_1 ?v7)
             (pred_7 ?v11)
             (pred_11 ?v6)
             (pred_8 ?v1)
             (pred_9 ?v11)
             (pred_12 ?v1)
             (pred_2 ))



(:action op_1
:parameters (?v13 ?v10 ?v8 ?v4)
:precondition (and (pred_1 ?v13) (pred_1 ?v10) (pred_7 ?v8) (pred_11 ?v4)
          (pred_3 ?v13 ?v10) (pred_4 ?v8 ?v4)
                   (pred_6 ?v10 ?v4) (pred_5 ?v13) 
                   (pred_8 ?v10) (pred_9 ?v8))
:effect (and  (pred_12 ?v10) (not (pred_8 ?v10))))


(:action op_3
:parameters (?v13 ?v9)
:precondition (and (pred_1 ?v13) (pred_1 ?v9)
               (pred_5 ?v13) (pred_3 ?v13 ?v9) (pred_12 ?v9))
:effect (and (pred_5 ?v9) (not (pred_5 ?v13))))

(:action op_4
:parameters (?v13 ?v8)
:precondition (and (pred_1 ?v13) (pred_7 ?v8) 
                  (pred_5 ?v13) (pred_10 ?v8 ?v13) (pred_2 ))
:effect (and (pred_9 ?v8)
   (not (pred_10 ?v8 ?v13)) (not (pred_2 ))))


(:action op_5
:parameters (?v13 ?v5 ?v2)
:precondition (and (pred_1 ?v13) (pred_7 ?v5) (pred_7 ?v2)
                  (pred_5 ?v13) (pred_9 ?v2) (pred_10 ?v5 ?v13))
:effect (and (pred_9 ?v5) (pred_10 ?v2 ?v13)
        (not (pred_9 ?v2)) (not (pred_10 ?v5 ?v13))))

(:action op_2
:parameters (?v13 ?v8)
:precondition (and (pred_1 ?v13) (pred_7 ?v8) 
                  (pred_5 ?v13) (pred_9 ?v8))
:effect (and (pred_2 ) (pred_10 ?v8 ?v13) (not (pred_9 ?v8)))))


	
