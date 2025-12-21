; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1282268636 --problem-name spanner-s4-n3-l4-s1282268636
(define (problem spanner-s4-n3-l4-s1282268636)
 (:domain spanner)
 (:objects 
     obj_11 - type_5
     obj_09 obj_07 obj_14 obj_13 - type_3
     obj_06 obj_05 obj_10 - type_1
     obj_12 obj_04 obj_03 obj_08 - type_2
     obj_01 obj_02 - type_2
    )
 (:init 
    (pred_6 obj_11 obj_01)
    (pred_6 obj_09 obj_04)
    (pred_5 obj_09)
    (pred_6 obj_07 obj_03)
    (pred_5 obj_07)
    (pred_6 obj_14 obj_03)
    (pred_5 obj_14)
    (pred_6 obj_13 obj_03)
    (pred_5 obj_13)
    (pred_4 obj_06)
    (pred_6 obj_06 obj_02)
    (pred_4 obj_05)
    (pred_6 obj_05 obj_02)
    (pred_4 obj_10)
    (pred_6 obj_10 obj_02)
    (pred_3 obj_01 obj_12)
    (pred_3 obj_08 obj_02)
    (pred_3 obj_12 obj_04)
    (pred_3 obj_04 obj_03)
    (pred_3 obj_03 obj_08)
)
 (:goal
  (and
   (pred_1 obj_06)
   (pred_1 obj_05)
   (pred_1 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_06)) (not (pred_1 obj_05))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_01)))
  )
)
)
