(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_08 - type_1
obj_03 obj_04 - type_2
obj_06 obj_02 obj_05 - type_3
obj_09 obj_07 obj_01 - object)
(:init
(pred_1 obj_08 obj_06)
(pred_3 obj_08 obj_03)
(pred_3 obj_08 obj_04)
(pred_2 obj_09 obj_06)
(pred_2 obj_07 obj_06)
(pred_2 obj_01 obj_05)
)
(:goal
(and
(pred_2 obj_09 obj_02)
(pred_2 obj_07 obj_02)
(pred_2 obj_01 obj_05)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_08 ?b obj_04))))
)
)