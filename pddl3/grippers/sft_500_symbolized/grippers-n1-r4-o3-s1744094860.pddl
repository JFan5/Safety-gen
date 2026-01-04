(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_02 - type_1
obj_03 obj_04 - type_2
obj_01 obj_09 obj_08 obj_10 - type_3
obj_06 obj_05 obj_07 - object)
(:init
(pred_3 obj_02 obj_09)
(pred_2 obj_02 obj_03)
(pred_2 obj_02 obj_04)
(pred_4 obj_06 obj_10)
(pred_4 obj_05 obj_08)
(pred_4 obj_07 obj_08)
)
(:goal
(and
(pred_4 obj_06 obj_01)
(pred_4 obj_05 obj_09)
(pred_4 obj_07 obj_08)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_02 ?b obj_03))))
)
)