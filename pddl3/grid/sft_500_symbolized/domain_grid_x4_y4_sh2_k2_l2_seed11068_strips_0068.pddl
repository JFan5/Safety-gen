(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v1 ?v9)
             (pred_3 ?v11 ?v8)
             (pred_6 ?v1 ?v8)
             (pred_1 ?v6 ?v1 )
	     (pred_11 ?v1)
             (pred_4 ?v12)
             (pred_8 ?v11)
             (pred_7 ?v8)
             (pred_9 ?v1)
             (pred_10 ?v11)
             (pred_2 ?v1)
             (pred_12 ))



(:action op_1
:parameters (?v13 ?v5 ?v4 ?v7)
:precondition (and (pred_4 ?v13) (pred_4 ?v5) (pred_8 ?v4) (pred_7 ?v7)
          (pred_5 ?v13 ?v5) (pred_3 ?v4 ?v7)
                   (pred_6 ?v5 ?v7) (pred_11 ?v13) 
                   (pred_9 ?v5) (pred_10 ?v4))
:effect (and  (pred_2 ?v5) (not (pred_9 ?v5))))


(:action op_2
:parameters (?v13 ?v10)
:precondition (and (pred_4 ?v13) (pred_4 ?v10)
               (pred_11 ?v13) (pred_5 ?v13 ?v10) (pred_2 ?v10))
:effect (and (pred_11 ?v10) (not (pred_11 ?v13))))

(:action op_5
:parameters (?v13 ?v4)
:precondition (and (pred_4 ?v13) (pred_8 ?v4) 
                  (pred_11 ?v13) (pred_1 ?v4 ?v13) (pred_12 ))
:effect (and (pred_10 ?v4)
   (not (pred_1 ?v4 ?v13)) (not (pred_12 ))))


(:action op_3
:parameters (?v13 ?v3 ?v2)
:precondition (and (pred_4 ?v13) (pred_8 ?v3) (pred_8 ?v2)
                  (pred_11 ?v13) (pred_10 ?v2) (pred_1 ?v3 ?v13))
:effect (and (pred_10 ?v3) (pred_1 ?v2 ?v13)
        (not (pred_10 ?v2)) (not (pred_1 ?v3 ?v13))))

(:action op_4
:parameters (?v13 ?v4)
:precondition (and (pred_4 ?v13) (pred_8 ?v4) 
                  (pred_11 ?v13) (pred_10 ?v4))
:effect (and (pred_12 ) (pred_1 ?v4 ?v13) (not (pred_10 ?v4)))))


	
