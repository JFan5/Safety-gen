; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1375674853 --problem-name spanner-s4-n3-l4-s1375674853
(define (problem spanner-s4-n3-l4-s1375674853)
 (:domain spanner)
 (:objects 
     obj_06 - type_4
     obj_07 obj_14 obj_02 obj_09 - type_5
     obj_11 obj_13 obj_03 - type_1
     obj_05 obj_04 obj_10 obj_01 - type_3
     obj_12 obj_08 - type_3
    )
 (:init 
    (pred_1 obj_06 obj_12)
    (pred_1 obj_07 obj_04)
    (pred_2 obj_07)
    (pred_1 obj_14 obj_05)
    (pred_2 obj_14)
    (pred_1 obj_02 obj_10)
    (pred_2 obj_02)
    (pred_1 obj_09 obj_10)
    (pred_2 obj_09)
    (pred_4 obj_11)
    (pred_1 obj_11 obj_08)
    (pred_4 obj_13)
    (pred_1 obj_13 obj_08)
    (pred_4 obj_03)
    (pred_1 obj_03 obj_08)
    (pred_5 obj_12 obj_05)
    (pred_5 obj_01 obj_08)
    (pred_5 obj_05 obj_04)
    (pred_5 obj_04 obj_10)
    (pred_5 obj_10 obj_01)
)
 (:goal
  (and
   (pred_3 obj_11)
   (pred_3 obj_13)
   (pred_3 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_11)) (not (pred_3 obj_13))))
    (forall (?m - type_4) (at-most-once (pred_1 ?m obj_12)))
  )
)
)
