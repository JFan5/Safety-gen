(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_09 - type_1
obj_10 obj_03 - type_3
obj_06 obj_08 obj_01 obj_05 - type_2
obj_07 obj_02 obj_04 - object)
(:init
(pred_4 obj_09 obj_05)
(pred_2 obj_09 obj_10)
(pred_2 obj_09 obj_03)
(pred_3 obj_07 obj_01)
(pred_3 obj_02 obj_08)
(pred_3 obj_04 obj_08)
)
(:goal
(and
(pred_3 obj_07 obj_01)
(pred_3 obj_02 obj_06)
(pred_3 obj_04 obj_05)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_09 ?b obj_03))))
)
)