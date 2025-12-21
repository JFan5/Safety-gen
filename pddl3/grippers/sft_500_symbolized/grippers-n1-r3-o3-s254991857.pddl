(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_09 - type_1
obj_08 obj_02 - type_2
obj_07 obj_06 obj_01 - type_3
obj_04 obj_03 obj_05 - object)
(:init
(pred_1 obj_09 obj_06)
(pred_3 obj_09 obj_08)
(pred_3 obj_09 obj_02)
(pred_2 obj_04 obj_06)
(pred_2 obj_03 obj_07)
(pred_2 obj_05 obj_01)
)
(:goal
(and
(pred_2 obj_04 obj_06)
(pred_2 obj_03 obj_07)
(pred_2 obj_05 obj_06)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_09 ?b obj_02))))
)
)