(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_07 - type_1
obj_05 obj_01 - type_3
obj_09 obj_10 obj_03 obj_04 - type_2
obj_08 obj_06 obj_02 - object)
(:init
(pred_4 obj_07 obj_04)
(pred_2 obj_07 obj_05)
(pred_2 obj_07 obj_01)
(pred_3 obj_08 obj_10)
(pred_3 obj_06 obj_03)
(pred_3 obj_02 obj_10)
)
(:goal
(and
(pred_3 obj_08 obj_10)
(pred_3 obj_06 obj_10)
(pred_3 obj_02 obj_09)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_07 ?b obj_01))))
)
)