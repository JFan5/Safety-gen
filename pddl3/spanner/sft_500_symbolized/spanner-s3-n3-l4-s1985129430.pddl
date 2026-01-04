; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1985129430 --problem-name spanner-s3-n3-l4-s1985129430
(define (problem spanner-s3-n3-l4-s1985129430)
 (:domain spanner)
 (:objects 
     obj_02 - type_2
     obj_09 obj_10 obj_04 - type_5
     obj_03 obj_01 obj_05 - type_1
     obj_13 obj_06 obj_07 obj_12 - type_3
     obj_11 obj_08 - type_3
    )
 (:init 
    (pred_4 obj_02 obj_11)
    (pred_4 obj_09 obj_07)
    (pred_2 obj_09)
    (pred_4 obj_10 obj_12)
    (pred_2 obj_10)
    (pred_4 obj_04 obj_07)
    (pred_2 obj_04)
    (pred_5 obj_03)
    (pred_4 obj_03 obj_08)
    (pred_5 obj_01)
    (pred_4 obj_01 obj_08)
    (pred_5 obj_05)
    (pred_4 obj_05 obj_08)
    (pred_6 obj_11 obj_13)
    (pred_6 obj_12 obj_08)
    (pred_6 obj_13 obj_06)
    (pred_6 obj_06 obj_07)
    (pred_6 obj_07 obj_12)
)
 (:goal
  (and
   (pred_1 obj_03)
   (pred_1 obj_01)
   (pred_1 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_01)) (not (pred_1 obj_05))))
    (forall (?m - type_2) (at-most-once (pred_4 ?m obj_11)))
  )
)
)
