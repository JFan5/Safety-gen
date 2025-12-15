(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_04 - type_2
obj_06 obj_01 - type_3
obj_02 obj_07 obj_03 - type_1
obj_05 obj_09 obj_08 - object)
(:init
(pred_3 obj_04 obj_03)
(pred_4 obj_04 obj_06)
(pred_4 obj_04 obj_01)
(pred_2 obj_05 obj_02)
(pred_2 obj_09 obj_03)
(pred_2 obj_08 obj_02)
)
(:goal
(and
(pred_2 obj_05 obj_02)
(pred_2 obj_09 obj_02)
(pred_2 obj_08 obj_07)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_04 ?b obj_01))))
)
)