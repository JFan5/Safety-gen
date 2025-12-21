; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 397434166 --problem-name spanner-s4-n3-l4-s397434166
(define (problem spanner-s4-n3-l4-s397434166)
 (:domain spanner)
 (:objects 
     obj_02 - type_5
     obj_12 obj_10 obj_13 obj_14 - type_3
     obj_04 obj_03 obj_01 - type_1
     obj_11 obj_06 obj_05 obj_08 - type_2
     obj_07 obj_09 - type_2
    )
 (:init 
    (pred_6 obj_02 obj_07)
    (pred_6 obj_12 obj_11)
    (pred_5 obj_12)
    (pred_6 obj_10 obj_06)
    (pred_5 obj_10)
    (pred_6 obj_13 obj_05)
    (pred_5 obj_13)
    (pred_6 obj_14 obj_11)
    (pred_5 obj_14)
    (pred_4 obj_04)
    (pred_6 obj_04 obj_09)
    (pred_4 obj_03)
    (pred_6 obj_03 obj_09)
    (pred_4 obj_01)
    (pred_6 obj_01 obj_09)
    (pred_3 obj_07 obj_11)
    (pred_3 obj_08 obj_09)
    (pred_3 obj_11 obj_06)
    (pred_3 obj_06 obj_05)
    (pred_3 obj_05 obj_08)
)
 (:goal
  (and
   (pred_1 obj_04)
   (pred_1 obj_03)
   (pred_1 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_04)) (not (pred_1 obj_03))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_07)))
  )
)
)
