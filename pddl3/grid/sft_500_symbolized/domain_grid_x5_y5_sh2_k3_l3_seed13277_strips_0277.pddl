(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v11 ?v7)
             (pred_10 ?v2 ?v9)
             (pred_11 ?v11 ?v9)
             (pred_6 ?v4 ?v11 )
	     (pred_4 ?v11)
             (pred_3 ?v6)
             (pred_2 ?v2)
             (pred_12 ?v9)
             (pred_1 ?v11)
             (pred_5 ?v2)
             (pred_7 ?v11)
             (pred_9 ))



(:action op_3
:parameters (?v13 ?v3 ?v8 ?v12)
:precondition (and (pred_3 ?v13) (pred_3 ?v3) (pred_2 ?v8) (pred_12 ?v12)
          (pred_8 ?v13 ?v3) (pred_10 ?v8 ?v12)
                   (pred_11 ?v3 ?v12) (pred_4 ?v13) 
                   (pred_1 ?v3) (pred_5 ?v8))
:effect (and  (pred_7 ?v3) (not (pred_1 ?v3))))


(:action op_2
:parameters (?v13 ?v10)
:precondition (and (pred_3 ?v13) (pred_3 ?v10)
               (pred_4 ?v13) (pred_8 ?v13 ?v10) (pred_7 ?v10))
:effect (and (pred_4 ?v10) (not (pred_4 ?v13))))

(:action op_1
:parameters (?v13 ?v8)
:precondition (and (pred_3 ?v13) (pred_2 ?v8) 
                  (pred_4 ?v13) (pred_6 ?v8 ?v13) (pred_9 ))
:effect (and (pred_5 ?v8)
   (not (pred_6 ?v8 ?v13)) (not (pred_9 ))))


(:action op_5
:parameters (?v13 ?v1 ?v5)
:precondition (and (pred_3 ?v13) (pred_2 ?v1) (pred_2 ?v5)
                  (pred_4 ?v13) (pred_5 ?v5) (pred_6 ?v1 ?v13))
:effect (and (pred_5 ?v1) (pred_6 ?v5 ?v13)
        (not (pred_5 ?v5)) (not (pred_6 ?v1 ?v13))))

(:action op_4
:parameters (?v13 ?v8)
:precondition (and (pred_3 ?v13) (pred_2 ?v8) 
                  (pred_4 ?v13) (pred_5 ?v8))
:effect (and (pred_9 ) (pred_6 ?v8 ?v13) (not (pred_5 ?v8)))))


	
