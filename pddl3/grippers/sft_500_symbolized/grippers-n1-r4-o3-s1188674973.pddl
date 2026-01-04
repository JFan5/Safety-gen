(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_10 - type_1
obj_09 obj_01 - type_3
obj_03 obj_05 obj_02 obj_06 - type_2
obj_08 obj_07 obj_04 - object)
(:init
(pred_2 obj_10 obj_05)
(pred_1 obj_10 obj_09)
(pred_1 obj_10 obj_01)
(pred_4 obj_08 obj_06)
(pred_4 obj_07 obj_03)
(pred_4 obj_04 obj_02)
)
(:goal
(and
(pred_4 obj_08 obj_02)
(pred_4 obj_07 obj_02)
(pred_4 obj_04 obj_02)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_10 ?b obj_01))))
)
)