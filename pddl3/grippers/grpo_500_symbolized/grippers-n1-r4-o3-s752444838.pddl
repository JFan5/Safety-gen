(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_09 - type_1
obj_05 obj_03 - type_3
obj_04 obj_08 obj_07 obj_01 - type_2
obj_10 obj_02 obj_06 - object)
(:init
(pred_4 obj_09 obj_08)
(pred_2 obj_09 obj_05)
(pred_2 obj_09 obj_03)
(pred_3 obj_10 obj_08)
(pred_3 obj_02 obj_08)
(pred_3 obj_06 obj_01)
)
(:goal
(and
(pred_3 obj_10 obj_08)
(pred_3 obj_02 obj_07)
(pred_3 obj_06 obj_07)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_09 ?b obj_03))))
)
)