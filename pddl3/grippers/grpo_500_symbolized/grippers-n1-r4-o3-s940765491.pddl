(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_06 - type_1
obj_09 obj_01 - type_3
obj_03 obj_02 obj_07 obj_05 - type_2
obj_08 obj_04 obj_10 - object)
(:init
(pred_4 obj_06 obj_02)
(pred_2 obj_06 obj_09)
(pred_2 obj_06 obj_01)
(pred_3 obj_08 obj_03)
(pred_3 obj_04 obj_02)
(pred_3 obj_10 obj_02)
)
(:goal
(and
(pred_3 obj_08 obj_02)
(pred_3 obj_04 obj_05)
(pred_3 obj_10 obj_03)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_06 ?b obj_01))))
)
)