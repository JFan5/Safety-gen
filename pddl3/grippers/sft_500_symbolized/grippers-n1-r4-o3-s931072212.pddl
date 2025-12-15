(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_09 - type_3
obj_01 obj_03 - type_1
obj_06 obj_10 obj_08 obj_07 - type_2
obj_02 obj_04 obj_05 - object)
(:init
(pred_4 obj_09 obj_07)
(pred_2 obj_09 obj_01)
(pred_2 obj_09 obj_03)
(pred_1 obj_02 obj_10)
(pred_1 obj_04 obj_07)
(pred_1 obj_05 obj_10)
)
(:goal
(and
(pred_1 obj_02 obj_10)
(pred_1 obj_04 obj_10)
(pred_1 obj_05 obj_06)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_09 ?b obj_03))))
)
)