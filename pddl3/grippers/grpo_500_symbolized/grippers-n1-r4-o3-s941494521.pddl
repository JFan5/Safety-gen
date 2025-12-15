(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_10 - type_1
obj_03 obj_09 - type_3
obj_06 obj_07 obj_01 obj_04 - type_2
obj_08 obj_05 obj_02 - object)
(:init
(pred_3 obj_10 obj_04)
(pred_4 obj_10 obj_03)
(pred_4 obj_10 obj_09)
(pred_2 obj_08 obj_06)
(pred_2 obj_05 obj_01)
(pred_2 obj_02 obj_07)
)
(:goal
(and
(pred_2 obj_08 obj_04)
(pred_2 obj_05 obj_06)
(pred_2 obj_02 obj_06)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_10 ?b obj_03))))
)
)