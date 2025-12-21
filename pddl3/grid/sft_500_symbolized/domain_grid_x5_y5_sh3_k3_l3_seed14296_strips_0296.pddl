(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v8 ?v3)
             (pred_1 ?v11 ?v1)
             (pred_12 ?v8 ?v1)
             (pred_10 ?v9 ?v8 )
	     (pred_5 ?v8)
             (pred_8 ?v12)
             (pred_3 ?v11)
             (pred_6 ?v1)
             (pred_11 ?v8)
             (pred_9 ?v11)
             (pred_7 ?v8)
             (pred_4 ))



(:action op_2
:parameters (?v13 ?v10 ?v6 ?v4)
:precondition (and (pred_8 ?v13) (pred_8 ?v10) (pred_3 ?v6) (pred_6 ?v4)
          (pred_2 ?v13 ?v10) (pred_1 ?v6 ?v4)
                   (pred_12 ?v10 ?v4) (pred_5 ?v13) 
                   (pred_11 ?v10) (pred_9 ?v6))
:effect (and  (pred_7 ?v10) (not (pred_11 ?v10))))


(:action op_5
:parameters (?v13 ?v7)
:precondition (and (pred_8 ?v13) (pred_8 ?v7)
               (pred_5 ?v13) (pred_2 ?v13 ?v7) (pred_7 ?v7))
:effect (and (pred_5 ?v7) (not (pred_5 ?v13))))

(:action op_1
:parameters (?v13 ?v6)
:precondition (and (pred_8 ?v13) (pred_3 ?v6) 
                  (pred_5 ?v13) (pred_10 ?v6 ?v13) (pred_4 ))
:effect (and (pred_9 ?v6)
   (not (pred_10 ?v6 ?v13)) (not (pred_4 ))))


(:action op_3
:parameters (?v13 ?v2 ?v5)
:precondition (and (pred_8 ?v13) (pred_3 ?v2) (pred_3 ?v5)
                  (pred_5 ?v13) (pred_9 ?v5) (pred_10 ?v2 ?v13))
:effect (and (pred_9 ?v2) (pred_10 ?v5 ?v13)
        (not (pred_9 ?v5)) (not (pred_10 ?v2 ?v13))))

(:action op_4
:parameters (?v13 ?v6)
:precondition (and (pred_8 ?v13) (pred_3 ?v6) 
                  (pred_5 ?v13) (pred_9 ?v6))
:effect (and (pred_4 ) (pred_10 ?v6 ?v13) (not (pred_9 ?v6)))))


	
