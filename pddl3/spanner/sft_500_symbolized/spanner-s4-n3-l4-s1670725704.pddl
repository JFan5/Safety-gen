; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1670725704 --problem-name spanner-s4-n3-l4-s1670725704
(define (problem spanner-s4-n3-l4-s1670725704)
 (:domain spanner)
 (:objects 
     obj_09 - type_5
     obj_06 obj_11 obj_12 obj_14 - type_4
     obj_03 obj_07 obj_02 - type_2
     obj_04 obj_08 obj_10 obj_13 - type_1
     obj_05 obj_01 - type_1
    )
 (:init 
    (pred_6 obj_09 obj_05)
    (pred_6 obj_06 obj_04)
    (pred_3 obj_06)
    (pred_6 obj_11 obj_13)
    (pred_3 obj_11)
    (pred_6 obj_12 obj_04)
    (pred_3 obj_12)
    (pred_6 obj_14 obj_10)
    (pred_3 obj_14)
    (pred_2 obj_03)
    (pred_6 obj_03 obj_01)
    (pred_2 obj_07)
    (pred_6 obj_07 obj_01)
    (pred_2 obj_02)
    (pred_6 obj_02 obj_01)
    (pred_4 obj_05 obj_04)
    (pred_4 obj_13 obj_01)
    (pred_4 obj_04 obj_08)
    (pred_4 obj_08 obj_10)
    (pred_4 obj_10 obj_13)
)
 (:goal
  (and
   (pred_1 obj_03)
   (pred_1 obj_07)
   (pred_1 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_03)) (not (pred_1 obj_07))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_05)))
  )
)
)
