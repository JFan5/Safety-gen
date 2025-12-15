(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v12 ?v2)
             (pred_12 ?v1 ?v9)
             (pred_5 ?v12 ?v9)
             (pred_10 ?v8 ?v12 )
	     (pred_6 ?v12)
             (pred_8 ?v11)
             (pred_1 ?v1)
             (pred_2 ?v9)
             (pred_4 ?v12)
             (pred_7 ?v1)
             (pred_11 ?v12)
             (pred_3 ))



(:action op_5
:parameters (?v13 ?v3 ?v4 ?v5)
:precondition (and (pred_8 ?v13) (pred_8 ?v3) (pred_1 ?v4) (pred_2 ?v5)
          (pred_9 ?v13 ?v3) (pred_12 ?v4 ?v5)
                   (pred_5 ?v3 ?v5) (pred_6 ?v13) 
                   (pred_4 ?v3) (pred_7 ?v4))
:effect (and  (pred_11 ?v3) (not (pred_4 ?v3))))


(:action op_3
:parameters (?v13 ?v10)
:precondition (and (pred_8 ?v13) (pred_8 ?v10)
               (pred_6 ?v13) (pred_9 ?v13 ?v10) (pred_11 ?v10))
:effect (and (pred_6 ?v10) (not (pred_6 ?v13))))

(:action op_2
:parameters (?v13 ?v4)
:precondition (and (pred_8 ?v13) (pred_1 ?v4) 
                  (pred_6 ?v13) (pred_10 ?v4 ?v13) (pred_3 ))
:effect (and (pred_7 ?v4)
   (not (pred_10 ?v4 ?v13)) (not (pred_3 ))))


(:action op_4
:parameters (?v13 ?v7 ?v6)
:precondition (and (pred_8 ?v13) (pred_1 ?v7) (pred_1 ?v6)
                  (pred_6 ?v13) (pred_7 ?v6) (pred_10 ?v7 ?v13))
:effect (and (pred_7 ?v7) (pred_10 ?v6 ?v13)
        (not (pred_7 ?v6)) (not (pred_10 ?v7 ?v13))))

(:action op_1
:parameters (?v13 ?v4)
:precondition (and (pred_8 ?v13) (pred_1 ?v4) 
                  (pred_6 ?v13) (pred_7 ?v4))
:effect (and (pred_3 ) (pred_10 ?v4 ?v13) (not (pred_7 ?v4)))))


	
