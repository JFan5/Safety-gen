; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1840050745 --problem-name spanner-s3-n3-l4-s1840050745
(define (problem spanner-s3-n3-l4-s1840050745)
 (:domain spanner)
 (:objects 
     obj_05 - type_3
     obj_12 obj_07 obj_13 - type_5
     obj_01 obj_02 obj_04 - type_1
     obj_10 obj_09 obj_08 obj_06 - type_4
     obj_11 obj_03 - type_4
    )
 (:init 
    (pred_3 obj_05 obj_11)
    (pred_3 obj_12 obj_08)
    (pred_2 obj_12)
    (pred_3 obj_07 obj_10)
    (pred_2 obj_07)
    (pred_3 obj_13 obj_10)
    (pred_2 obj_13)
    (pred_6 obj_01)
    (pred_3 obj_01 obj_03)
    (pred_6 obj_02)
    (pred_3 obj_02 obj_03)
    (pred_6 obj_04)
    (pred_3 obj_04 obj_03)
    (pred_4 obj_11 obj_10)
    (pred_4 obj_06 obj_03)
    (pred_4 obj_10 obj_09)
    (pred_4 obj_09 obj_08)
    (pred_4 obj_08 obj_06)
)
 (:goal
  (and
   (pred_1 obj_01)
   (pred_1 obj_02)
   (pred_1 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_02)) (not (pred_1 obj_04))))
    (forall (?m - type_3) (at-most-once (pred_3 ?m obj_11)))
  )
)
)
