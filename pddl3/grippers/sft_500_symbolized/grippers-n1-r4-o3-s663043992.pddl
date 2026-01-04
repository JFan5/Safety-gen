(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_06 - type_2
obj_03 obj_05 - type_3
obj_08 obj_10 obj_01 obj_04 - type_1
obj_09 obj_07 obj_02 - object)
(:init
(pred_4 obj_06 obj_08)
(pred_1 obj_06 obj_03)
(pred_1 obj_06 obj_05)
(pred_3 obj_09 obj_04)
(pred_3 obj_07 obj_01)
(pred_3 obj_02 obj_01)
)
(:goal
(and
(pred_3 obj_09 obj_10)
(pred_3 obj_07 obj_08)
(pred_3 obj_02 obj_08)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_06 ?b obj_05))))
)
)