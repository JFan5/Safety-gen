(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v4 ?v5)
             (pred_5 ?v8 ?v1)
             (pred_1 ?v4 ?v1)
             (pred_7 ?v7 ?v4 )
	     (pred_4 ?v4)
             (pred_3 ?v10)
             (pred_11 ?v8)
             (pred_10 ?v1)
             (pred_2 ?v4)
             (pred_8 ?v8)
             (pred_9 ?v4)
             (pred_6 ))



(:action op_3
:parameters (?v13 ?v11 ?v12 ?v3)
:precondition (and (pred_3 ?v13) (pred_3 ?v11) (pred_11 ?v12) (pred_10 ?v3)
          (pred_12 ?v13 ?v11) (pred_5 ?v12 ?v3)
                   (pred_1 ?v11 ?v3) (pred_4 ?v13) 
                   (pred_2 ?v11) (pred_8 ?v12))
:effect (and  (pred_9 ?v11) (not (pred_2 ?v11))))


(:action op_1
:parameters (?v13 ?v6)
:precondition (and (pred_3 ?v13) (pred_3 ?v6)
               (pred_4 ?v13) (pred_12 ?v13 ?v6) (pred_9 ?v6))
:effect (and (pred_4 ?v6) (not (pred_4 ?v13))))

(:action op_4
:parameters (?v13 ?v12)
:precondition (and (pred_3 ?v13) (pred_11 ?v12) 
                  (pred_4 ?v13) (pred_7 ?v12 ?v13) (pred_6 ))
:effect (and (pred_8 ?v12)
   (not (pred_7 ?v12 ?v13)) (not (pred_6 ))))


(:action op_2
:parameters (?v13 ?v9 ?v2)
:precondition (and (pred_3 ?v13) (pred_11 ?v9) (pred_11 ?v2)
                  (pred_4 ?v13) (pred_8 ?v2) (pred_7 ?v9 ?v13))
:effect (and (pred_8 ?v9) (pred_7 ?v2 ?v13)
        (not (pred_8 ?v2)) (not (pred_7 ?v9 ?v13))))

(:action op_5
:parameters (?v13 ?v12)
:precondition (and (pred_3 ?v13) (pred_11 ?v12) 
                  (pred_4 ?v13) (pred_8 ?v12))
:effect (and (pred_6 ) (pred_7 ?v12 ?v13) (not (pred_8 ?v12)))))


	
