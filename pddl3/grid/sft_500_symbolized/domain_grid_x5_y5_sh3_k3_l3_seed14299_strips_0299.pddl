(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v6 ?v11)
             (pred_3 ?v9 ?v2)
             (pred_4 ?v6 ?v2)
             (pred_1 ?v1 ?v6 )
	     (pred_5 ?v6)
             (pred_8 ?v4)
             (pred_12 ?v9)
             (pred_2 ?v2)
             (pred_7 ?v6)
             (pred_10 ?v9)
             (pred_11 ?v6)
             (pred_6 ))



(:action op_3
:parameters (?v13 ?v5 ?v8 ?v3)
:precondition (and (pred_8 ?v13) (pred_8 ?v5) (pred_12 ?v8) (pred_2 ?v3)
          (pred_9 ?v13 ?v5) (pred_3 ?v8 ?v3)
                   (pred_4 ?v5 ?v3) (pred_5 ?v13) 
                   (pred_7 ?v5) (pred_10 ?v8))
:effect (and  (pred_11 ?v5) (not (pred_7 ?v5))))


(:action op_2
:parameters (?v13 ?v7)
:precondition (and (pred_8 ?v13) (pred_8 ?v7)
               (pred_5 ?v13) (pred_9 ?v13 ?v7) (pred_11 ?v7))
:effect (and (pred_5 ?v7) (not (pred_5 ?v13))))

(:action op_4
:parameters (?v13 ?v8)
:precondition (and (pred_8 ?v13) (pred_12 ?v8) 
                  (pred_5 ?v13) (pred_1 ?v8 ?v13) (pred_6 ))
:effect (and (pred_10 ?v8)
   (not (pred_1 ?v8 ?v13)) (not (pred_6 ))))


(:action op_5
:parameters (?v13 ?v10 ?v12)
:precondition (and (pred_8 ?v13) (pred_12 ?v10) (pred_12 ?v12)
                  (pred_5 ?v13) (pred_10 ?v12) (pred_1 ?v10 ?v13))
:effect (and (pred_10 ?v10) (pred_1 ?v12 ?v13)
        (not (pred_10 ?v12)) (not (pred_1 ?v10 ?v13))))

(:action op_1
:parameters (?v13 ?v8)
:precondition (and (pred_8 ?v13) (pred_12 ?v8) 
                  (pred_5 ?v13) (pred_10 ?v8))
:effect (and (pred_6 ) (pred_1 ?v8 ?v13) (not (pred_10 ?v8)))))


	
