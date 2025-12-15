(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v3 ?v1)
             (pred_3 ?v12 ?v2)
             (pred_7 ?v3 ?v2)
             (pred_11 ?v10 ?v3 )
	     (pred_12 ?v3)
             (pred_10 ?v9)
             (pred_8 ?v12)
             (pred_1 ?v2)
             (pred_9 ?v3)
             (pred_6 ?v12)
             (pred_5 ?v3)
             (pred_2 ))



(:action op_5
:parameters (?v13 ?v7 ?v8 ?v11)
:precondition (and (pred_10 ?v13) (pred_10 ?v7) (pred_8 ?v8) (pred_1 ?v11)
          (pred_4 ?v13 ?v7) (pred_3 ?v8 ?v11)
                   (pred_7 ?v7 ?v11) (pred_12 ?v13) 
                   (pred_9 ?v7) (pred_6 ?v8))
:effect (and  (pred_5 ?v7) (not (pred_9 ?v7))))


(:action op_4
:parameters (?v13 ?v5)
:precondition (and (pred_10 ?v13) (pred_10 ?v5)
               (pred_12 ?v13) (pred_4 ?v13 ?v5) (pred_5 ?v5))
:effect (and (pred_12 ?v5) (not (pred_12 ?v13))))

(:action op_1
:parameters (?v13 ?v8)
:precondition (and (pred_10 ?v13) (pred_8 ?v8) 
                  (pred_12 ?v13) (pred_11 ?v8 ?v13) (pred_2 ))
:effect (and (pred_6 ?v8)
   (not (pred_11 ?v8 ?v13)) (not (pred_2 ))))


(:action op_2
:parameters (?v13 ?v6 ?v4)
:precondition (and (pred_10 ?v13) (pred_8 ?v6) (pred_8 ?v4)
                  (pred_12 ?v13) (pred_6 ?v4) (pred_11 ?v6 ?v13))
:effect (and (pred_6 ?v6) (pred_11 ?v4 ?v13)
        (not (pred_6 ?v4)) (not (pred_11 ?v6 ?v13))))

(:action op_3
:parameters (?v13 ?v8)
:precondition (and (pred_10 ?v13) (pred_8 ?v8) 
                  (pred_12 ?v13) (pred_6 ?v8))
:effect (and (pred_2 ) (pred_11 ?v8 ?v13) (not (pred_6 ?v8)))))


	
