; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 423179346 --problem-name spanner-s2-n2-l3-s423179346
(define (problem spanner-s2-n2-l3-s423179346)
 (:domain spanner)
 (:objects 
     obj_04 - type_3
     obj_08 obj_06 - type_4
     obj_01 obj_09 - type_2
     obj_05 obj_10 obj_07 - type_5
     obj_03 obj_02 - type_5
    )
 (:init 
    (pred_2 obj_04 obj_03)
    (pred_2 obj_08 obj_05)
    (pred_5 obj_08)
    (pred_2 obj_06 obj_07)
    (pred_5 obj_06)
    (pred_6 obj_01)
    (pred_2 obj_01 obj_02)
    (pred_6 obj_09)
    (pred_2 obj_09 obj_02)
    (pred_4 obj_03 obj_05)
    (pred_4 obj_07 obj_02)
    (pred_4 obj_05 obj_10)
    (pred_4 obj_10 obj_07)
)
 (:goal
  (and
   (pred_1 obj_01)
   (pred_1 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_01)) (not (pred_1 obj_09))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_03)))
  )
)
)
