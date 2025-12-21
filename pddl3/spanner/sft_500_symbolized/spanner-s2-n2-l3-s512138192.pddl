; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 512138192 --problem-name spanner-s2-n2-l3-s512138192
(define (problem spanner-s2-n2-l3-s512138192)
 (:domain spanner)
 (:objects 
     obj_09 - type_3
     obj_06 obj_10 - type_5
     obj_08 obj_05 - type_4
     obj_02 obj_04 obj_01 - type_2
     obj_03 obj_07 - type_2
    )
 (:init 
    (pred_2 obj_09 obj_03)
    (pred_2 obj_06 obj_04)
    (pred_1 obj_06)
    (pred_2 obj_10 obj_02)
    (pred_1 obj_10)
    (pred_5 obj_08)
    (pred_2 obj_08 obj_07)
    (pred_5 obj_05)
    (pred_2 obj_05 obj_07)
    (pred_6 obj_03 obj_02)
    (pred_6 obj_01 obj_07)
    (pred_6 obj_02 obj_04)
    (pred_6 obj_04 obj_01)
)
 (:goal
  (and
   (pred_3 obj_08)
   (pred_3 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_08)) (not (pred_3 obj_05))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_03)))
  )
)
)
