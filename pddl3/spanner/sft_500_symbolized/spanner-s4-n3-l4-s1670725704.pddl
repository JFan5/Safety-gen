; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1670725704 --problem-name spanner-s4-n3-l4-s1670725704
(define (problem spanner-s4-n3-l4-s1670725704)
 (:domain spanner)
 (:objects 
     obj_02 - type_4
     obj_08 obj_03 obj_11 obj_10 - type_1
     obj_05 obj_06 obj_13 - type_2
     obj_09 obj_01 obj_12 obj_14 - type_5
     obj_04 obj_07 - type_5
    )
 (:init 
    (pred_4 obj_02 obj_04)
    (pred_4 obj_08 obj_09)
    (pred_6 obj_08)
    (pred_4 obj_03 obj_14)
    (pred_6 obj_03)
    (pred_4 obj_11 obj_09)
    (pred_6 obj_11)
    (pred_4 obj_10 obj_12)
    (pred_6 obj_10)
    (pred_3 obj_05)
    (pred_4 obj_05 obj_07)
    (pred_3 obj_06)
    (pred_4 obj_06 obj_07)
    (pred_3 obj_13)
    (pred_4 obj_13 obj_07)
    (pred_5 obj_04 obj_09)
    (pred_5 obj_14 obj_07)
    (pred_5 obj_09 obj_01)
    (pred_5 obj_01 obj_12)
    (pred_5 obj_12 obj_14)
)
 (:goal
  (and
   (pred_1 obj_05)
   (pred_1 obj_06)
   (pred_1 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_05)) (not (pred_1 obj_06))))
    (forall (?m - type_4) (at-most-once (pred_4 ?m obj_04)))
  )
)
)
