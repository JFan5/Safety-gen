; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1375674853 --problem-name spanner-s4-n3-l4-s1375674853
(define (problem spanner-s4-n3-l4-s1375674853)
 (:domain spanner)
 (:objects 
     obj_10 - type_5
     obj_11 obj_02 obj_12 obj_09 - type_2
     obj_06 obj_13 obj_14 - type_4
     obj_01 obj_08 obj_05 obj_07 - type_3
     obj_04 obj_03 - type_3
    )
 (:init 
    (pred_5 obj_10 obj_04)
    (pred_5 obj_11 obj_08)
    (pred_6 obj_11)
    (pred_5 obj_02 obj_01)
    (pred_6 obj_02)
    (pred_5 obj_12 obj_05)
    (pred_6 obj_12)
    (pred_5 obj_09 obj_05)
    (pred_6 obj_09)
    (pred_4 obj_06)
    (pred_5 obj_06 obj_03)
    (pred_4 obj_13)
    (pred_5 obj_13 obj_03)
    (pred_4 obj_14)
    (pred_5 obj_14 obj_03)
    (pred_2 obj_04 obj_01)
    (pred_2 obj_07 obj_03)
    (pred_2 obj_01 obj_08)
    (pred_2 obj_08 obj_05)
    (pred_2 obj_05 obj_07)
)
 (:goal
  (and
   (pred_3 obj_06)
   (pred_3 obj_13)
   (pred_3 obj_14)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_06)) (not (pred_3 obj_13))))
    (forall (?m - type_5) (at-most-once (pred_5 ?m obj_04)))
  )
)
)
