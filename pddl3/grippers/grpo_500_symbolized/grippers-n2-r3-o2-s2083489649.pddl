(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_10 obj_09 - type_1
obj_04 obj_01 obj_07 obj_02 - type_3
obj_03 obj_08 obj_05 - type_2
obj_11 obj_06 - object)
(:init
(pred_3 obj_10 obj_08)
(pred_4 obj_10 obj_04)
(pred_4 obj_10 obj_01)
(pred_3 obj_09 obj_03)
(pred_4 obj_09 obj_07)
(pred_4 obj_09 obj_02)
(pred_2 obj_11 obj_03)
(pred_2 obj_06 obj_03)
)
(:goal
(and
(pred_2 obj_11 obj_08)
(pred_2 obj_06 obj_03)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_10 obj_08) (pred_3 obj_09 obj_08))))
  )
)
)