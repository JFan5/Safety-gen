(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v6 ?v1)
             (pred_11 ?v9 ?v5)
             (pred_3 ?v6 ?v5)
             (pred_5 ?v8 ?v6 )
	     (pred_9 ?v6)
             (pred_6 ?v4)
             (pred_2 ?v9)
             (pred_4 ?v5)
             (pred_12 ?v6)
             (pred_1 ?v9)
             (pred_8 ?v6)
             (pred_7 ))



(:action op_3
:parameters (?v13 ?v11 ?v10 ?v2)
:precondition (and (pred_6 ?v13) (pred_6 ?v11) (pred_2 ?v10) (pred_4 ?v2)
          (pred_10 ?v13 ?v11) (pred_11 ?v10 ?v2)
                   (pred_3 ?v11 ?v2) (pred_9 ?v13) 
                   (pred_12 ?v11) (pred_1 ?v10))
:effect (and  (pred_8 ?v11) (not (pred_12 ?v11))))


(:action op_5
:parameters (?v13 ?v12)
:precondition (and (pred_6 ?v13) (pred_6 ?v12)
               (pred_9 ?v13) (pred_10 ?v13 ?v12) (pred_8 ?v12))
:effect (and (pred_9 ?v12) (not (pred_9 ?v13))))

(:action op_2
:parameters (?v13 ?v10)
:precondition (and (pred_6 ?v13) (pred_2 ?v10) 
                  (pred_9 ?v13) (pred_5 ?v10 ?v13) (pred_7 ))
:effect (and (pred_1 ?v10)
   (not (pred_5 ?v10 ?v13)) (not (pred_7 ))))


(:action op_4
:parameters (?v13 ?v7 ?v3)
:precondition (and (pred_6 ?v13) (pred_2 ?v7) (pred_2 ?v3)
                  (pred_9 ?v13) (pred_1 ?v3) (pred_5 ?v7 ?v13))
:effect (and (pred_1 ?v7) (pred_5 ?v3 ?v13)
        (not (pred_1 ?v3)) (not (pred_5 ?v7 ?v13))))

(:action op_1
:parameters (?v13 ?v10)
:precondition (and (pred_6 ?v13) (pred_2 ?v10) 
                  (pred_9 ?v13) (pred_1 ?v10))
:effect (and (pred_7 ) (pred_5 ?v10 ?v13) (not (pred_1 ?v10)))))


	
