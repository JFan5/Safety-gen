(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_02 - type_2
obj_07 obj_01 - type_3
obj_03 obj_05 obj_08 - type_1
obj_04 obj_06 obj_09 - object)
(:init
(pred_4 obj_02 obj_03)
(pred_3 obj_02 obj_07)
(pred_3 obj_02 obj_01)
(pred_1 obj_04 obj_05)
(pred_1 obj_06 obj_05)
(pred_1 obj_09 obj_08)
)
(:goal
(and
(pred_1 obj_04 obj_03)
(pred_1 obj_06 obj_05)
(pred_1 obj_09 obj_08)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_02 ?b obj_01))))
)
)